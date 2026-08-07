.class public Ll/ud2$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ud2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/String;

.field public d:J


# direct methods
.method public constructor <init>(IILjava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ud2$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/ud2$b;->b:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/ud2$b;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p4, p0, Ll/ud2$b;->d:J

    .line 11
    .line 12
    return-void
.end method
