.class public final synthetic Ll/te70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hf70;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/hf70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/te70;->a:Ll/hf70;

    iput-object p2, p0, Ll/te70;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/te70;->a:Ll/hf70;

    iget-object p0, p0, Ll/te70;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/hf70;->b(Ll/hf70;Ljava/lang/String;)V

    return-void
.end method
