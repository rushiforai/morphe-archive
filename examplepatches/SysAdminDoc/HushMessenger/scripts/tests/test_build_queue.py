import os
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from scripts import build_queue as queue


class BuildQueueCommands(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.wrapper = self.root / "it's wrapper.ps1"
        self.wrapper.write_text("")
        self.queue_script = self.root / "build-queue.ps1"
        self.queue_script.write_text("")

    def environment(self, wrapper="", queue_script=""):
        return patch.dict(
            os.environ,
            {queue.WRAPPER: str(wrapper), queue.QUEUE: str(queue_script)},
        )

    def test_unset_runs_gradlew_and_the_job_itself_with_their_own_limits(self):
        with self.environment():
            command = queue.gradle(self.root, [":patches:test", "--no-daemon"])
            self.assertEqual(
                [
                    str(self.root / ("gradlew.bat" if sys.platform == "win32" else "gradlew")),
                    ":patches:test",
                    "--no-daemon",
                ],
                command,
            )
            self.assertEqual(["java", "-jar", "desktop.jar"], queue.queued(["java", "-jar", "desktop.jar"], "job"))
            self.assertEqual(600, queue.time_limit(600, gradle_job=True))
            self.assertEqual(1800, queue.time_limit(1800))

    def test_wrapper_gets_every_task_as_one_literal_and_passes_the_exit_code(self):
        tasks = [
            ":patches:checkRebuiltApk",
            "-PvalidationApk=C:/a b/it's.apk",
            "-Dorg.gradle.jvmargs=-Xmx1024m -XX:ActiveProcessorCount=2",
            "--no-daemon",
        ]
        with self.environment(wrapper=self.wrapper):
            command = queue.gradle(self.root, tasks)
        self.assertEqual("-Command", command[-2])
        script = command[-1]
        self.assertTrue(script.startswith("& '" + str(self.wrapper).replace("'", "''") + "' -ProjectDir "))
        self.assertIn("-PvalidationApk=C:/a b/it''s.apk", script)
        self.assertIn("'-Dorg.gradle.jvmargs=-Xmx1024m -XX:ActiveProcessorCount=2'", script)
        self.assertTrue(script.endswith("); exit $LASTEXITCODE"))
        self.assertIn("-Tasks @(':patches:checkRebuiltApk', ", script)

    def test_queue_runs_the_command_line_inside_a_labelled_slot(self):
        job = ["java", "-jar", "desktop.jar", "--enable=Hide People You May Know", "C:/it's.apk"]
        with self.environment(queue_script=self.queue_script):
            command = queue.queued(job, "hushmessenger heap patch 346213494")
            self.assertEqual(
                ["-File", str(self.queue_script), "-Label", "hushmessenger heap patch 346213494", "-Run"],
                command[-6:-1],
            )
            self.assertEqual(
                "$ErrorActionPreference = 'Stop'; "
                "& 'java' '-jar' 'desktop.jar' '--enable=Hide People You May Know' 'C:/it''s.apk'; exit $LASTEXITCODE",
                command[-1],
            )
            # Waiting for a slot doesn't count against the job.
            self.assertEqual(1800 + queue.QUEUE_WAIT_SECONDS, queue.time_limit(1800))
            # Gradle waits in the wrapper's queue, not this one.
            self.assertEqual(600, queue.time_limit(600, gradle_job=True))
            # PowerShell drops an empty argument, which would shift every one after it.
            with self.assertRaisesRegex(ValueError, "empty argument"):
                queue.queued(["java", "", "desktop.jar"], "job")

    def test_a_named_script_that_is_missing_stops_instead_of_running_unqueued(self):
        missing = self.root / "gone.ps1"
        with self.environment(wrapper=missing, queue_script=missing):
            with self.assertRaisesRegex(ValueError, "HUSHMESSENGER_BUILD_WRAPPER names .*gone.ps1"):
                queue.gradle(self.root, [":patches:test"])
            with self.assertRaisesRegex(ValueError, "BUILD_QUEUE_SCRIPT names .*gone.ps1"):
                queue.queued(["java"], "job")

    @unittest.skipUnless(sys.platform == "win32", "User-scope variables are a Windows registry read")
    def test_user_scope_fills_in_only_when_the_process_has_no_value(self):
        with patch.dict(os.environ, {}, clear=False):
            os.environ.pop(queue.QUEUE, None)
            with patch.object(queue, "_user_setting", return_value=str(self.queue_script)) as user:
                self.assertEqual(str(self.queue_script), queue.setting(queue.QUEUE))
                user.assert_called_once_with(queue.QUEUE)
            os.environ[queue.QUEUE] = ""
            with patch.object(queue, "_user_setting", return_value=str(self.queue_script)) as user:
                self.assertEqual("", queue.setting(queue.QUEUE))
                user.assert_not_called()


if __name__ == "__main__":
    unittest.main()
