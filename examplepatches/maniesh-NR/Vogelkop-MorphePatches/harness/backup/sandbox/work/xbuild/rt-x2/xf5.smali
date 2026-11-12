.class public final Lxf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwf5;


# instance fields
.field public final synthetic a:Lyf5;


# direct methods
.method public constructor <init>(Lyf5;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxf5;->a:Lyf5;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lxf5;->a:Lyf5;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Ld63;->finish(Lhjm;)V

    return-void
.end method
