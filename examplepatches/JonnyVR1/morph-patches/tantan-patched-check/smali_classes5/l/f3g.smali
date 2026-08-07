.class public final synthetic Ll/f3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h3g;

.field public final synthetic b:Ll/syf0;


# direct methods
.method public synthetic constructor <init>(Ll/h3g;Ll/syf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f3g;->a:Ll/h3g;

    iput-object p2, p0, Ll/f3g;->b:Ll/syf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f3g;->a:Ll/h3g;

    iget-object p0, p0, Ll/f3g;->b:Ll/syf0;

    invoke-static {v0, p0}, Ll/h3g;->e(Ll/h3g;Ll/syf0;)V

    return-void
.end method
