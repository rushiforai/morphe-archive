.class public final synthetic Ll/g450;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k450;

.field public final synthetic b:Ll/syf0;


# direct methods
.method public synthetic constructor <init>(Ll/k450;Ll/syf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g450;->a:Ll/k450;

    iput-object p2, p0, Ll/g450;->b:Ll/syf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g450;->a:Ll/k450;

    iget-object p0, p0, Ll/g450;->b:Ll/syf0;

    invoke-static {v0, p0}, Ll/k450;->c(Ll/k450;Ll/syf0;)V

    return-void
.end method
