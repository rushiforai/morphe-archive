"""Post-metric-append ownership; original fatal-discard graph is reused."""
PERSISTED_EDITS = [dict(owner='La83;', signature='m(Lny;I)V', index=113,
    original=['move-object v0, v9'], replacement=[
        'invoke-static {v8}, La83;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;',
        'move-result-object v8', 'invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z',
        'move-result v0', 'if-eqz v0, @121', 'const/4 v0, 0x3',
        'const-wide/16 v14, -0x1', 'goto/32 @41', 'move-object v0, v9'])]
