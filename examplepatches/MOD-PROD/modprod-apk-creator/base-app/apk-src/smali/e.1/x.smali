.class public final Le/x;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field public final synthetic a:Le/y;


# direct methods
.method public constructor <init>(Le/y;)V
    .locals 0

    iput-object p1, p0, Le/x;->a:Le/y;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Le/x;->a:Le/y;

    invoke-virtual {p1}, Le/y;->g()V

    return-void
.end method
