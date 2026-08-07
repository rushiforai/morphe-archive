.class public Lcom/immomo/moment/mediautils/n$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/Boolean;

.field final synthetic e:Lcom/immomo/moment/mediautils/n;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/n;Ljava/lang/String;JJZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/n$a;->e:Lcom/immomo/moment/mediautils/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/moment/mediautils/n$a;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/immomo/moment/mediautils/n$a;->a:J

    .line 9
    .line 10
    iput-wide p5, p0, Lcom/immomo/moment/mediautils/n$a;->b:J

    .line 11
    .line 12
    invoke-static {p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/immomo/moment/mediautils/n$a;->d:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-void
.end method
