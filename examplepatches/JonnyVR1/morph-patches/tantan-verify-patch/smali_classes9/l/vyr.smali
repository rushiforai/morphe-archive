.class public Ll/vyr;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Ll/vyr;->c:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/vyr;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Ll/vyr;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p1, p0, Ll/vyr;->c:I

    .line 9
    .line 10
    return-void
.end method
