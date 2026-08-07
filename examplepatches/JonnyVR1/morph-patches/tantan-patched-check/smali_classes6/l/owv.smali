.class public final synthetic Ll/owv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qpw;


# instance fields
.field public final synthetic a:Ll/vwv;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/vwv;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/owv;->a:Ll/vwv;

    iput-object p2, p0, Ll/owv;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/owv;->a:Ll/vwv;

    iget-object p0, p0, Ll/owv;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2}, Ll/vwv;->d(Ll/vwv;Ljava/lang/String;ILjava/lang/Exception;)V

    return-void
.end method
