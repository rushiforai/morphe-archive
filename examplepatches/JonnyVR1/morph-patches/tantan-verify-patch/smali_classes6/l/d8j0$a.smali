.class public Ll/d8j0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d8j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d8j0$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/d8j0$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/d8j0$a;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/d8j0$a;->d:I

    .line 11
    .line 12
    return-void
.end method
