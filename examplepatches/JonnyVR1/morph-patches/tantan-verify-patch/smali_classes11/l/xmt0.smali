.class public final Ll/xmt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/twv0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Ll/kzv0;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/wmt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xmt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/kzv0;)Ll/twv0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmt0;->b:Ll/kzv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzb()Ll/uwv0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xmt0;->b:Ll/kzv0;

    .line 2
    .line 3
    const-class v1, Ll/kzv0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/zmt0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/xmt0;->a:Ll/ont0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/xmt0;->b:Ll/kzv0;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v0, v1, p0, v2}, Ll/zmt0;-><init>(Ll/ont0;Ll/kzv0;Ll/ymt0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
