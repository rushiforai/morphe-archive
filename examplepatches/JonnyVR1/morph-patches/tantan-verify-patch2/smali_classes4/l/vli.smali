.class public Ll/vli;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public c:Z

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vli;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vli;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/vli;->c:Z

    .line 10
    .line 11
    iput p1, p0, Ll/vli;->d:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Ll/vli;->a:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Ll/vli;->b:Ljava/lang/String;

    .line 17
    iput-boolean p3, p0, Ll/vli;->c:Z

    const/4 p1, 0x0

    .line 18
    iput p1, p0, Ll/vli;->d:I

    return-void
.end method
