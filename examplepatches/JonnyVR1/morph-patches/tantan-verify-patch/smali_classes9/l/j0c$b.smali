.class public Ll/j0c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j0c;->L3(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/j0c;


# direct methods
.method public constructor <init>(Ll/j0c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j0c$b;->a:Ll/j0c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j0c$b;->a:Ll/j0c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/j0c$b;->a:Ll/j0c;

    .line 14
    .line 15
    iget-object v0, v0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/j0c$b;->a:Ll/j0c;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/j0c;->i:Lcom/p1/mobile/android/app/Dialog;

    .line 24
    .line 25
    :cond_0
    return-void
.end method
