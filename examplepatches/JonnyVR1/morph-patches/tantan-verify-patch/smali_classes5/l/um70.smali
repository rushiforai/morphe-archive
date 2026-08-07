.class public final synthetic Ll/um70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/an70;


# direct methods
.method public synthetic constructor <init>(Ll/an70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/um70;->a:Ll/an70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/um70;->a:Ll/an70;

    invoke-static {p0}, Ll/an70;->c(Ll/an70;)V

    return-void
.end method
