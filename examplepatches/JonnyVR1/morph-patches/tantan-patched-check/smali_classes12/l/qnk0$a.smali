.class final Ll/qnk0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/hdata/android/MDevice$MmuidCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qnk0;->b(Ll/ag60;Ll/bej0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ag60;


# direct methods
.method public constructor <init>(Ll/ag60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qnk0$a;->a:Ll/ag60;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMMUIDGetComplete(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qnk0$a;->a:Ll/ag60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ag60;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMMUIDGetError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qnk0$a;->a:Ll/ag60;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ag60;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
