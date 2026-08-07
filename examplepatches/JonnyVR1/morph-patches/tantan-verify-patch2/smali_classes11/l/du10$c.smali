.class Ll/du10$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/du10;->i0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/du10;


# direct methods
.method public constructor <init>(Ll/du10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10$c;->a:Ll/du10;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(II)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "VideoRecord"

    .line 14
    .line 15
    const-string p2, "onError what:%d extra:%d"

    .line 16
    .line 17
    invoke-static {p1, p2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
