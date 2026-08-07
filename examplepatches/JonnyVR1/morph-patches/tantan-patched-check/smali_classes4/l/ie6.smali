.class public final synthetic Ll/ie6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ue6;

.field public final synthetic b:Ll/sj6;


# direct methods
.method public synthetic constructor <init>(Ll/ue6;Ll/sj6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ie6;->a:Ll/ue6;

    iput-object p2, p0, Ll/ie6;->b:Ll/sj6;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ie6;->a:Ll/ue6;

    iget-object p0, p0, Ll/ie6;->b:Ll/sj6;

    invoke-static {v0, p0}, Ll/ue6;->w0(Ll/ue6;Ll/sj6;)V

    return-void
.end method
