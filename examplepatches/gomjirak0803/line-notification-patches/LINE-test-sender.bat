@echo off
cd /d "%~dp0"
python scripts\line_test_sender.py
if errorlevel 1 pause
