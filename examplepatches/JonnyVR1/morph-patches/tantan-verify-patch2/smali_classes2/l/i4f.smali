.class public Ll/i4f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:I

.field private final b:I

.field private final c:I

.field private final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(IIILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/i4f;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/i4f;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/i4f;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Ll/i4f;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/i4f;->c:I

    .line 2
    .line 3
    return p0
.end method
