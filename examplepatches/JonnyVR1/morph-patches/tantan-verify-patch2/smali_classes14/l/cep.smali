.class public final synthetic Ll/cep;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/dep;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/dep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cep;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/cep;->b:Ll/dep;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cep;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/cep;->b:Ll/dep;

    invoke-static {v0, p0}, Ll/dep;->a(Ljava/lang/String;Ll/dep;)V

    return-void
.end method
