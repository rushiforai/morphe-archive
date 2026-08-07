.class Ll/u660$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u660;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:[B


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/u660$c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/u660$c;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u660$c;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/u660$c;->d:[B

    .line 11
    .line 12
    return-void
.end method
