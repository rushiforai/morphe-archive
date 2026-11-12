.class public final Lzbh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lssh;


# instance fields
.field public final synthetic b:Lvr9;


# direct methods
.method public constructor <init>(Lbch;Lvr9;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzbh;->b:Lvr9;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lzbh;->b:Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    return-void
.end method

.method public final b()V
    .registers 1

    iget-object p0, p0, Lzbh;->b:Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    return-void
.end method
