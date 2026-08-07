.class public Ll/r4f0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r4f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/r4f0$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/r4f0$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r4f0$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method
