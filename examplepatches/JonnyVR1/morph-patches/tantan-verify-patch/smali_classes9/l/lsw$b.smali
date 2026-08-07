.class public Ll/lsw$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lsw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lsw$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lsw$b;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Ll/lsw$b;->d:I

    .line 9
    .line 10
    return-void
.end method
