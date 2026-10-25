"""Flushed progress events; reporting intervals never limit an operation's runtime."""

import json
import time


class Progress:
    def __init__(self, operation, total=None):
        self.operation = operation
        self.total = total
        self.completed = 0
        self.details = {}
        self.status = "started"
        self.started = time.perf_counter()
        self.last_report = self.started

    def emit(self, status, **details):
        self.status = status
        event = {
            "operation": self.operation,
            "status": status,
            "elapsed_seconds": round(time.perf_counter() - self.started, 3),
            **self.details,
            **details,
        }
        if self.total is not None:
            event.update(completed=self.completed, total=self.total)
        print(json.dumps({"cloudflare_progress": event}), flush=True)
        self.last_report = time.perf_counter()

    def update(self, completed=None, **details):
        if completed is not None:
            self.completed = completed
        self.details.update(details)
        if time.perf_counter() - self.last_report >= 10:
            self.emit("running", **details)

    def __enter__(self):
        self.emit("started")
        return self

    def __exit__(self, error_type, error, traceback):
        self.emit("failed" if error_type else "completed")
