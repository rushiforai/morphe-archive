.class public final synthetic Ll/t5p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/e6p0;

.field public final synthetic b:Ll/vak0;


# direct methods
.method public synthetic constructor <init>(Ll/e6p0;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5p0;->a:Ll/e6p0;

    iput-object p2, p0, Ll/t5p0;->b:Ll/vak0;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5p0;->a:Ll/e6p0;

    iget-object p0, p0, Ll/t5p0;->b:Ll/vak0;

    invoke-static {v0, p0}, Ll/e6p0;->S(Ll/e6p0;Ll/vak0;)V

    return-void
.end method
