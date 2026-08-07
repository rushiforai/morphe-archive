.class Ll/arw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/arw;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/arw;


# direct methods
.method public constructor <init>(Ll/arw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/arw$a;->a:Ll/arw;

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
    iget p2, p1, Ll/y84;->a:I

    .line 4
    .line 5
    const/16 v0, 0x3ea

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/arw$a;->a:Ll/arw;

    .line 10
    .line 11
    iget-object p2, p0, Ll/arw;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/arw;->c:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "MWCHolder"

    .line 20
    .line 21
    const-string v0, "release:trigger:callback:error @url=%s, @error=%s"

    .line 22
    .line 23
    invoke-static {p1, p2, v0, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
