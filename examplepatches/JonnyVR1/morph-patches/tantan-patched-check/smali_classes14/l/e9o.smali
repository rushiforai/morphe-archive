.class public final synthetic Ll/e9o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r9o;

.field public final synthetic b:Ljava/lang/Boolean;


# direct methods
.method public synthetic constructor <init>(Ll/r9o;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9o;->a:Ll/r9o;

    iput-object p2, p0, Ll/e9o;->b:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e9o;->a:Ll/r9o;

    iget-object p0, p0, Ll/e9o;->b:Ljava/lang/Boolean;

    invoke-static {v0, p0}, Ll/r9o;->k3(Ll/r9o;Ljava/lang/Boolean;)V

    return-void
.end method
