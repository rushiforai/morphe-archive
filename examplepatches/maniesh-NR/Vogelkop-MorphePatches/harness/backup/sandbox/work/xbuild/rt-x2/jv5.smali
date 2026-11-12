.class public final Ljv5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljv5;->a:Ljava/lang/String;

    iput-object p2, p0, Ljv5;->b:Ljava/lang/String;

    iput-object p3, p0, Ljv5;->c:Ljava/lang/String;

    iput-object p4, p0, Ljv5;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ljv5;->e:Z

    return-void
.end method
