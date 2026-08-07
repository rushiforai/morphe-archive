.class Ll/zqw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zqw;->j(Ljava/lang/String;)Ll/zqw$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zqw$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/y84;Ljava/lang/Object;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p2, Ll/zqw;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zqw$b;->a:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v0, Lcom/immomo/mwc/sdk/EventType;->MK_CREATE:Lcom/immomo/mwc/sdk/EventType;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "trigger error @event=%s, @error=%s"

    .line 18
    .line 19
    invoke-static {p2, p0, v0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
