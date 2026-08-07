.class public Ll/i900$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i900;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:I

.field public c:I

.field public d:Z

.field public final synthetic e:Ll/i900;


# direct methods
.method public constructor <init>(Ll/i900;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/i900$a;->e:Ll/i900;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    iput-wide v0, p0, Ll/i900$a;->a:J

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/i900$a;->b:I

    .line 12
    .line 13
    return-void
.end method

.method public synthetic constructor <init>(Ll/i900;Ll/j900;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ll/i900$a;-><init>(Ll/i900;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Ll/i900$a;->a:J

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    iput v0, p0, Ll/i900$a;->b:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/i900$a;->c:I

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/i900$a;->d:Z

    .line 12
    .line 13
    return-void
.end method
