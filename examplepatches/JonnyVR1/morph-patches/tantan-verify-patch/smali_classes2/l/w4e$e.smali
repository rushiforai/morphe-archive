.class public final Ll/w4e$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w4e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "e"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:J

.field private final c:[J

.field private final d:[Ljava/io/File;

.field final synthetic e:Ll/w4e;


# direct methods
.method private constructor <init>(Ll/w4e;Ljava/lang/String;J[Ljava/io/File;[J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w4e$e;->e:Ll/w4e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/w4e$e;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Ll/w4e$e;->b:J

    .line 9
    .line 10
    iput-object p5, p0, Ll/w4e$e;->d:[Ljava/io/File;

    .line 11
    .line 12
    iput-object p6, p0, Ll/w4e$e;->c:[J

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/w4e;Ljava/lang/String;J[Ljava/io/File;[JLl/w4e$a;)V
    .locals 0

    .line 15
    invoke-direct/range {p0 .. p6}, Ll/w4e$e;-><init>(Ll/w4e;Ljava/lang/String;J[Ljava/io/File;[J)V

    return-void
.end method


# virtual methods
.method public a(I)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w4e$e;->d:[Ljava/io/File;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method
