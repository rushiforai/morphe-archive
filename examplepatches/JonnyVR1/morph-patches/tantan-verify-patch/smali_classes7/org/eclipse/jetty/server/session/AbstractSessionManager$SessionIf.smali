.class public interface abstract Lorg/eclipse/jetty/server/session/AbstractSessionManager$SessionIf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hnl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/session/AbstractSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SessionIf"
.end annotation


# virtual methods
.method public abstract synthetic getAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract synthetic getAttributeNames()Ljava/util/Enumeration;
.end method

.method public abstract synthetic getCreationTime()J
.end method

.method public abstract synthetic getId()Ljava/lang/String;
.end method

.method public abstract synthetic getLastAccessedTime()J
.end method

.method public abstract synthetic getMaxInactiveInterval()I
.end method

.method public abstract synthetic getServletContext()Ll/ase0;
.end method

.method public abstract getSession()Lorg/eclipse/jetty/server/session/AbstractSession;
.end method

.method public abstract synthetic getSessionContext()Ll/lnl;
.end method

.method public abstract synthetic getValue(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract synthetic getValueNames()[Ljava/lang/String;
.end method

.method public abstract synthetic invalidate()V
.end method

.method public abstract synthetic isNew()Z
.end method

.method public abstract synthetic putValue(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract synthetic removeAttribute(Ljava/lang/String;)V
.end method

.method public abstract synthetic removeValue(Ljava/lang/String;)V
.end method

.method public abstract synthetic setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract synthetic setMaxInactiveInterval(I)V
.end method
