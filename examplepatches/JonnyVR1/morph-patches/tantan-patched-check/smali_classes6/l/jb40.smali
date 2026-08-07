.class public final synthetic Ll/jb40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lb40;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/lb40;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jb40;->a:Ll/lb40;

    iput-object p2, p0, Ll/jb40;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jb40;->a:Ll/lb40;

    iget-object p0, p0, Ll/jb40;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/lb40;->i0(Ll/lb40;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
