.class public Ll/bo60$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bo60;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bo60;


# direct methods
.method public constructor <init>(Ll/bo60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bo60$a;->a:Ll/bo60;

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
    iget-object v0, p0, Ll/bo60$a;->a:Ll/bo60;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bo60;->e(Ll/bo60;)Ll/pej0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/bo60$a;->a:Ll/bo60;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bo60;->e(Ll/bo60;)Ll/pej0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
