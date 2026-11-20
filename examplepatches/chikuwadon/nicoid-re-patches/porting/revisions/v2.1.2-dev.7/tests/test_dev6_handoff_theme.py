#!/usr/bin/env python3
"""Regression contracts for dev.6 menu glow theme preservation and popup handoff."""
from pathlib import Path
p=Path(__file__).resolve().parents[1]
ambient=(p/'AmbientCard217.java').read_text()
overlay=(p/'overlay.py').read_text()
popup=(p/'PopupSwitch274.java').read_text()
stage=(p/'stage_candidate.py').read_text()
assert 'public static void themedColor(View view, int color)' in ambient
assert 'card.setDrawable(0, next)' in ambient
assert 'card.base = next' in ambient
assert 'if (previous instanceof Card)' in ambient
assert 'view.setBackgroundColor(color);' in ambient
assert "source = in_method(source,\n        '.method public static background(Landroid/view/View;)V'" in overlay
assert 'AmbientCard217;->themedColor(Landroid/view/View;I)V' in overlay
assert '.method public static intercept(Ljava/lang/Object;Z)Z' in overlay
assert 'PopupSwitch274;->delay(Landroid/app/Activity;)J' in overlay
assert 'private static final long DEFAULT_DELAY_MS = 500L;' in popup
assert 'private static final long POPUP_DELAY_MS = 180L;' in popup
assert '"popup".equals(selection)' in popup
assert 'com.sauzask.nicoid.NicoidVideoActivity' in popup
assert 'if (activity == null || activity.isFinishing() || activity.isDestroyed())' in popup
assert "('e/e/a/ThemeChoice.smali','AmbientCard217;->themedColor')" in stage
assert "('e/e/a/AppSwitchGuard.smali','PopupSwitch274;->delay')" in stage
assert 'ThemeChoice.smali' in stage and 'PopupSwitch274.smali' in stage
print('PASS: dev.6 keeps ambient theme wrapper; only popup video mode shortens handoff latency')
