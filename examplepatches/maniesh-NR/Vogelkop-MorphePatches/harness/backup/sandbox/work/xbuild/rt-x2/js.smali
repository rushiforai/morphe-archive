.class public abstract Ljs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le4a;


# instance fields
.field public final a:Lgt;

.field public final b:Lds;


# direct methods
.method public constructor <init>(Lgt;Lds;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljs;->a:Lgt;

    iput-object p2, p0, Ljs;->b:Lds;

    return-void
.end method


# virtual methods
.method public final b()La26;
    .registers 1

    iget-object p0, p0, Ljs;->b:Lds;

    iget-object p0, p0, Lds;->a:La26;

    return-object p0
.end method
