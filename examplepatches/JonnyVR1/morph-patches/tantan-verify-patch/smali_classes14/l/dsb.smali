.class public final synthetic Ll/dsb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/esb;

.field public final synthetic b:Ll/kcg0;


# direct methods
.method public synthetic constructor <init>(Ll/esb;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dsb;->a:Ll/esb;

    iput-object p2, p0, Ll/dsb;->b:Ll/kcg0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dsb;->a:Ll/esb;

    iget-object p0, p0, Ll/dsb;->b:Ll/kcg0;

    invoke-static {v0, p0}, Ll/esb;->d(Ll/esb;Ll/kcg0;)V

    return-void
.end method
