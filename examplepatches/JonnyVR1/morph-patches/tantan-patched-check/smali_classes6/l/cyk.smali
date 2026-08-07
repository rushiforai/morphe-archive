.class public final synthetic Ll/cyk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fyk;

.field public final synthetic b:Ll/wtl;


# direct methods
.method public synthetic constructor <init>(Ll/fyk;Ll/wtl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cyk;->a:Ll/fyk;

    iput-object p2, p0, Ll/cyk;->b:Ll/wtl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyk;->a:Ll/fyk;

    iget-object p0, p0, Ll/cyk;->b:Ll/wtl;

    invoke-static {v0, p0}, Ll/fyk;->E(Ll/fyk;Ll/wtl;)V

    return-void
.end method
