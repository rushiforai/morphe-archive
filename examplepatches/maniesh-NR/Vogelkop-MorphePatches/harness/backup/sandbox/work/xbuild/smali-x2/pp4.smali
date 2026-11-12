.class public final Lpp4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpp4;->a:Ljava/lang/String;

    iput-object p2, p0, Lpp4;->b:Ljava/lang/String;

    iput-boolean p3, p0, Lpp4;->c:Z

    return-void
.end method
