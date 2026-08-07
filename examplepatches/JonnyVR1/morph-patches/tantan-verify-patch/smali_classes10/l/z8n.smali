.class public final synthetic Ll/z8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c9n;


# direct methods
.method public synthetic constructor <init>(Ll/c9n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z8n;->a:Ll/c9n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8n;->a:Ll/c9n;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/c9n;->T3(Ll/c9n;Ljava/util/List;)V

    return-void
.end method
