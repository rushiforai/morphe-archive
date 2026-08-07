.class public final synthetic Ll/rg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sg5;

.field public final synthetic b:Ll/g6x;


# direct methods
.method public synthetic constructor <init>(Ll/sg5;Ll/g6x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rg5;->a:Ll/sg5;

    iput-object p2, p0, Ll/rg5;->b:Ll/g6x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rg5;->a:Ll/sg5;

    iget-object p0, p0, Ll/rg5;->b:Ll/g6x;

    invoke-static {v0, p0}, Ll/sg5;->y(Ll/sg5;Ll/g6x;)V

    return-void
.end method
