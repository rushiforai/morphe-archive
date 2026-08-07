.class public Ll/a31$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a31;->q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/a31;


# direct methods
.method public constructor <init>(Ll/a31;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a31$a;->a:Ll/a31;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a31$a;->a:Ll/a31;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/a31;->a(Ll/a31;Landroid/os/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
