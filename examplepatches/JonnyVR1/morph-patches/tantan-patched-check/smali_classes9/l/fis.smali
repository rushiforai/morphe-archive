.class public final synthetic Ll/fis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bjs;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/bjs;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fis;->a:Ll/bjs;

    iput-boolean p2, p0, Ll/fis;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fis;->a:Ll/bjs;

    iget-boolean p0, p0, Ll/fis;->b:Z

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/bjs;->d4(Ll/bjs;ZLjava/util/List;)V

    return-void
.end method
