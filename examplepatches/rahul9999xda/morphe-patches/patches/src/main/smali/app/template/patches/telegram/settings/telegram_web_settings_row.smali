# Telegram Web 13.1.1
# Insert immediately before return-void in:
# Lorg/telegram/ui/t91;->b0(Lorg/telegram/ui/t91;Ljava/util/ArrayList;)V
# Verified locals at insertion point: v1 = ArrayList; v4 is free.
# Keep Context in v4. createSettingsRow returns View in v0.

    sget-object v4, Lorg/telegram/messenger/ApplicationLoader;->applicationContext:Landroid/content/Context;
    invoke-static {v4}, Lapp/template/extension/telegram/MorpheSettingsEntry;->createSettingsRow(Landroid/content/Context;)Landroid/view/View;
    move-result-object v0

    # g71.l(View) returns Telegram's custom-view settings item; z defaults to -1.
    invoke-static {v0}, Lorg/telegram/ui/Components/g71;->l(Landroid/view/View;)Lorg/telegram/ui/Components/g71;
    move-result-object v2

    # Preserve v1 (the original settings ArrayList).
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
