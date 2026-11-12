.class public final Lip;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:J


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lip;->a:Ljava/lang/String;

    iput-object p6, p0, Lip;->b:Ljava/lang/String;

    iput-wide p1, p0, Lip;->c:J

    iput-wide p3, p0, Lip;->d:J

    return-void
.end method
