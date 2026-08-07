.class public final synthetic Ll/bl80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z2m;


# instance fields
.field public final synthetic a:Ll/cl80;

.field public final synthetic b:Ll/al80;


# direct methods
.method public synthetic constructor <init>(Ll/cl80;Ll/al80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bl80;->a:Ll/cl80;

    iput-object p2, p0, Ll/bl80;->b:Ll/al80;

    return-void
.end method


# virtual methods
.method public final a(Ll/d3m;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bl80;->a:Ll/cl80;

    iget-object p0, p0, Ll/bl80;->b:Ll/al80;

    invoke-static {v0, p0, p1}, Ll/cl80;->a(Ll/cl80;Ll/al80;Ll/d3m;)V

    return-void
.end method
