.class public Ll/iqp0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iqp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/iqp0$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/iqp0$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/iqp0$a;->c:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
