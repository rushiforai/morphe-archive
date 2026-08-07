.class public final synthetic Ll/o9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p9s;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/p9s;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o9s;->a:Ll/p9s;

    iput-object p2, p0, Ll/o9s;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o9s;->a:Ll/p9s;

    iget-object p0, p0, Ll/o9s;->b:Ll/x20;

    invoke-static {v0, p0, p1}, Ll/p9s;->a(Ll/p9s;Ll/x20;Ljava/lang/Object;)V

    return-void
.end method
