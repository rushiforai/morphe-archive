.class public Ll/oze$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oze;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public final b:I

.field public final c:I

.field public final d:I

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Ll/oze$a;->b:I

    .line 21
    iput p2, p0, Ll/oze$a;->c:I

    .line 22
    iput p3, p0, Ll/oze$a;->d:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oze$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/oze$a;->c:I

    .line 7
    .line 8
    iput p3, p0, Ll/oze$a;->d:I

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/oze$a;->b:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Ll/oze$a;->e:Ljava/lang/String;

    .line 16
    iput p2, p0, Ll/oze$a;->b:I

    .line 17
    iput p3, p0, Ll/oze$a;->c:I

    .line 18
    iput p4, p0, Ll/oze$a;->d:I

    return-void
.end method
