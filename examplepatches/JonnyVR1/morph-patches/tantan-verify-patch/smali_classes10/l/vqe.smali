.class public final synthetic Ll/vqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vqe;->a:Ll/y20;

    iput-object p2, p0, Ll/vqe;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vqe;->a:Ll/y20;

    iget-object p0, p0, Ll/vqe;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/wqe;->a(Ll/y20;Ljava/lang/String;)V

    return-void
.end method
