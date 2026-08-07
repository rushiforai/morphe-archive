.class public final synthetic Ll/mqk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ark0;

.field public final synthetic b:Ll/gvn0;


# direct methods
.method public synthetic constructor <init>(Ll/ark0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqk0;->a:Ll/ark0;

    iput-object p2, p0, Ll/mqk0;->b:Ll/gvn0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mqk0;->a:Ll/ark0;

    iget-object p0, p0, Ll/mqk0;->b:Ll/gvn0;

    invoke-static {v0, p0}, Ll/ark0;->Y3(Ll/ark0;Ll/gvn0;)V

    return-void
.end method
