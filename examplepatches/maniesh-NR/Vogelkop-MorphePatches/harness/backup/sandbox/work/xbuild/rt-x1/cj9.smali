.class public final Lcj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lffd;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcj9;->a:Ljava/lang/String;

    iput-object p3, p0, Lcj9;->b:Ljava/lang/String;

    iput p1, p0, Lcj9;->c:I

    iput-object p4, p0, Lcj9;->d:Ljava/lang/String;

    iput-object p5, p0, Lcj9;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final isEmpty()Z
    .registers 1

    iget-object p0, p0, Lcj9;->a:Ljava/lang/String;

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method
