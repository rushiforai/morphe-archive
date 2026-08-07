.class public final Ll/a5b0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a5b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:[Ll/a5b0$b;


# direct methods
.method public varargs constructor <init>([Ll/a5b0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a5b0$a;->a:[Ll/a5b0$b;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)Ll/a5b0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5b0$a;->a:[Ll/a5b0$b;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5b0$a;->a:[Ll/a5b0$b;

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method
