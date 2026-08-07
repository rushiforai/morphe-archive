.class public final synthetic Ll/e6t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/v3f$b;


# direct methods
.method public synthetic constructor <init>(Ll/x20;Ll/v3f$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e6t;->a:Ll/x20;

    iput-object p2, p0, Ll/e6t;->b:Ll/v3f$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e6t;->a:Ll/x20;

    iget-object p0, p0, Ll/e6t;->b:Ll/v3f$b;

    invoke-static {v0, p0, p1}, Ll/i6t;->W2(Ll/x20;Ll/v3f$b;Ljava/lang/Object;)V

    return-void
.end method
