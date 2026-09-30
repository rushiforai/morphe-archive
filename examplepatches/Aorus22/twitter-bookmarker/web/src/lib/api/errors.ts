/**
 * Typed error for every gallery API failure.
 *
 * Carries the backend's `reason` string and the HTTP status so Phases 4–8 can
 * render the error/retry states from PRD-2 §61 without re-parsing a response.
 * A transport-level failure (backend not running, DNS, offline) is reported as
 * status `0` so callers have a single failure path.
 */
export class ApiError extends Error {
  /** The backend's `reason` field, or a client-side fallback message. */
  readonly reason: string
  /** HTTP status code, or `0` when the request never reached the backend. */
  readonly status: number

  constructor(reason: string, status: number, options?: { cause?: unknown }) {
    super(reason, options)
    this.name = "ApiError"
    this.reason = reason
    this.status = status
  }

  /** True when the backend was unreachable rather than returning an error. */
  get isNetworkError(): boolean {
    return this.status === 0
  }

  /** True when the requested collection does not exist (PRD-2 §54). */
  get isNotFound(): boolean {
    return this.status === 404
  }
}

/** Narrow an unknown caught value to an {@link ApiError}. */
export function isApiError(value: unknown): value is ApiError {
  if (value instanceof ApiError) {
    return true
  }

  return (
    typeof value === "object" &&
    value !== null &&
    (value as { name?: unknown }).name === "ApiError" &&
    typeof (value as { reason?: unknown }).reason === "string" &&
    typeof (value as { status?: unknown }).status === "number"
  )
}
